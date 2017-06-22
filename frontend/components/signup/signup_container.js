import { connect } from 'react-redux';
import { signup, signin } from '../../actions/session_actions';
import SignUp from './signup_form';
import { withRouter } from 'react-router-dom';

const mapStateToProps = ({session}) => {
  debugger
  return {
    errors: session.errors
  }
};

const mapDispatchToProps = (dispatch, { location }) => {
  debugger
  return {
    processForm: (user) => dispatch(signup(user)),
    signin: (user) => dispatch(signin(user))
  };
};

export default withRouter(
  connect(
    mapStateToProps,
    mapDispatchToProps
)(SignUp));
